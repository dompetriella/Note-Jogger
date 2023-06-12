List<String> noteStrings = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

enum TrebleClefNotes {
  // below staff
  C0,
  D0,
  E0,
  F0,
  G0,
  A0,
  B0,
  C1,
  D1,
  // staff
  E1,
  F1,
  G1,
  A1,
  B1,
  C2,
  D2,
  E2,
  F2,
  // above staff
  G2,
  A2,
  B2,
  C3,
  D3,
  E3,
  F3,
  G3;

  final String clefImagePath;
  const TrebleClefNotes({this.clefImagePath = 'assets/treble_clef.svg'});
}

enum BassClefNotes {
  // below staff
  E0,
  F0,
  G0,
  A0,
  B0,
  C0,
  D0,
  E1,
  F1,
  // staff
  G1,
  A1,
  B1,
  C1,
  D1,
  E2,
  F2,
  G2,
  A2,
  // above staff
  B2,
  C2,
  D2,
  E3,
  F3,
  G3,
  A3,
  B3;

  final String clefImagePath;
  const BassClefNotes({this.clefImagePath = 'assets/bass_clef.svg'});
}
