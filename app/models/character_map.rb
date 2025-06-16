class CharacterMap
  def self.encode(char)
    ENCODE_LIST[char.to_sym]
  end

  def self.decode(num)
    DECODE_LIST[num]
  end

  def self.allowed_characters
    DECODE_LIST
  end

  def self.allowed_characters_count
    DECODE_LIST.length
  end

  ENCODE_LIST = {
    a: 0,
    b: 1,
    c: 2,
    d: 3,
    e: 4,
    f: 5,
    g: 6,
    h: 7,
    i: 8,
    j: 9,
    k: 10,
    l: 11,
    m: 12,
    n: 13,
    o: 14,
    p: 15,
    q: 16,
    r: 17,
    s: 18,
    t: 19,
    u: 20,
    v: 21,
    w: 22,
    x: 23,
    y: 24,
    z: 25,
    A: 26,
    B: 27,
    C: 28,
    D: 29,
    E: 30,
    F: 31,
    G: 32,
    H: 33,
    I: 34,
    J: 35,
    K: 36,
    L: 37,
    M: 38,
    N: 39,
    O: 40,
    P: 41,
    Q: 42,
    R: 43,
    S: 44,
    T: 45,
    U: 46,
    V: 47,
    W: 48,
    X: 49,
    Y: 50,
    Z: 51,
    ' ': 52

  }.freeze

  DECODE_LIST = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    ' '
  ].freeze
end
