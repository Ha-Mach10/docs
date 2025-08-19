const a1ColumnStringToNumber = (value: string): number =>
  value
  .toUpperCase()
  .split("")
  .filter(x => x !== null && x !== " " && new RegExp("[A-z]").test(x))
  .reverse()
  .map((c, index) => (c.charCodeAt(0) - 64) * (26 ** index))
  .reduce((tmpSum, x) => tmpSum + x, 0);