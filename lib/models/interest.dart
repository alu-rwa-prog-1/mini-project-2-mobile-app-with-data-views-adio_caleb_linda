class Interest {
  final String interestId;
  final String interestName;
  final String interestImagePath;
  const Interest(
      {required this.interestId,
        required this.interestName,
        required this.interestImagePath});
}

const INTERESTS = [
  Interest(interestId: "1", interestName: "Suicide", interestImagePath: ""),
  Interest(interestId: "2", interestName: "Domestic Violence", interestImagePath: ""),
  Interest(
      interestId: "3", interestName: "Depression", interestImagePath: ""),
  Interest(interestId: "4", interestName: "Disorders", interestImagePath: ""),
  Interest(interestId: "5", interestName: "Bullying", interestImagePath: ""),
  Interest(interestId: "6", interestName: "Addiction", interestImagePath: ""),
  Interest(interestId: "7", interestName: "Trauma", interestImagePath: ""),
  Interest(interestId: "8", interestName: "Schizophrenia", interestImagePath: ""),
];