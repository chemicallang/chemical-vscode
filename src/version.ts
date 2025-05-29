export type Prerelease = 'alpha' | 'beta' | 'nightly';

export interface Version {
  major: number;
  minor: number;
  patch: number;
  prerelease?: Prerelease;
}

/**
 * Parses a version string into its components without using regular expressions.
 *
 * Supports optional leading 'v', three numeric segments, and an optional prerelease tag.
 * Examples:
 *   "v1.2.3"
 *   "1.2.3-alpha"
 *   "2.0.0-nightly"
 *
 * @param input The version string to parse.
 * @returns A Version object or null if the string is invalid.
 */
export function parseVersion(input: string): Version | null {
  let str = input;

  // Strip optional leading 'v'
  if (str.startsWith('v')) {
    str = str.slice(1);
  }

  // Extract prerelease if present
  let prerelease: Prerelease | undefined;
  const dashPos = str.indexOf('-');
  if (dashPos !== -1) {
    const tag = str.slice(dashPos + 1);
    if (tag === 'alpha' || tag === 'beta' || tag === 'nightly') {
      prerelease = tag as Prerelease;
    } else {
      return null;
    }
    str = str.slice(0, dashPos);
  }

  // Split into numeric parts
  const parts = str.split('.');
  if (parts.length !== 3) {
    return null;
  }

  // Validate and parse each segment as digits
  const [majStr, minStr, patStr] = parts;
  if (!isDigits(majStr) || !isDigits(minStr) || !isDigits(patStr)) {
    return null;
  }

  const major = Number(majStr);
  const minor = Number(minStr);
  const patch = Number(patStr);

  // Ensure safe integers
  if (!Number.isSafeInteger(major) || !Number.isSafeInteger(minor) || !Number.isSafeInteger(patch)) {
    return null;
  }

  const version: Version = { major, minor, patch };
  if (prerelease) {
    version.prerelease = prerelease;
  }

  return version;
}

/**
 * Checks if a string consists solely of ASCII digits.
 */
function isDigits(str: string): boolean {
  if (str.length === 0) {
    return false;
  }
  for (let i = 0; i < str.length; i++) {
    const code = str.charCodeAt(i);
    if (code < 48 || code > 57) { // '0' to '9'
      return false;
    }
  }
  return true;
}

/**
 * Compares two Version objects.
 *
 * Returns:
 *  1 if a > b
 *  0 if a == b
 * -1 if a < b
 *
 * Ordering respects numeric segments and prerelease precedence:
 *   stable > nightly > beta > alpha
 */
export function compareVersions(a: Version, b: Version): number {
  // Compare numeric segments
  if (a.major !== b.major) {
    return a.major > b.major ? 1 : -1;
  }
  if (a.minor !== b.minor) {
    return a.minor > b.minor ? 1 : -1;
  }
  if (a.patch !== b.patch) {
    return a.patch > b.patch ? 1 : -1;
  }

  // Same numeric version; compare prerelease weights
  const weight = (v?: Prerelease): number => {
    switch (v) {
      case null: return 3;  // stable
      case undefined: return 3; // stable
      case 'nightly': return 2;
      case 'beta': return 1;
      case 'alpha': return 0;
    }
  };

  const wa = weight(a.prerelease);
  const wb = weight(b.prerelease);
  if (wa !== wb) {
    return wa > wb ? 1 : -1;
  }

  return 0;
}


/**
 * Returns true if version a is strictly greater than version b.
 */
export function isVersionGreater(a: Version, b: Version): boolean {
  return compareVersions(a, b) === 1;
}