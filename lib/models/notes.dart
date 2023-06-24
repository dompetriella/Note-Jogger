List<String> noteStrings = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

enum TrebleClefNotes {
  // below staff
  C3,
  D3_flat,
  D3,
  E3_flat,
  E3,
  F3,
  G3_flat,
  G3,
  A3_flat,
  A3,
  B3_flat,
  B3,
  C4,
  D4_flat,
  D4,
  // staff
  E4_flat,
  E4,
  F4,
  G4_flat,
  G4,
  A4_flat,
  A4,
  B4_flat,
  B4,
  C5,
  D5_flat,
  D5,
  E5_flat,
  E5,
  F5,
  // above staff
  G5_flat,
  G5,
  A5_flat,
  A5,
  B5_flat,
  B5,
  C6,
  D6_flat,
  D6,
  E6_flat,
  E6,
  F6,
  G6_flat,
  G6;

  final String clefImagePath;
  const TrebleClefNotes({this.clefImagePath = 'assets/treble_clef.svg'});
}

enum BassClefNotes {
  // below staff
  E1,
  F2,
  G2_flat,
  G2,
  A2_flat,
  A2,
  B2_flat,
  B2,
  C2,
  D2_flat,
  D2,
  E2_flat,
  E2,
  F3,
  // staff
  G3_flat,
  G3,
  A3_flat,
  A3,
  B3_flat,
  B3,
  C3,
  D3_flat,
  D3,
  E3_flat,
  E3,
  F4,
  G4_flat,
  G4,
  A4_flat,
  A4,
  // above staff
  B4_flat,
  B4,
  C4,
  D4_flat,
  D4,
  E4_flat,
  E4,
  F5,
  G5_flat,
  G5,
  A5_flat,
  A5,
  B5_flat,
  B5;

  final String clefImagePath;
  const BassClefNotes({this.clefImagePath = 'assets/bass_clef.svg'});
}
