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
  Interest(interestId: "1", interestName: "Technology", interestImagePath: ""),
  Interest(interestId: "2", interestName: "Politics", interestImagePath: ""),
  Interest(
      interestId: "3", interestName: "Christianity", interestImagePath: ""),
  Interest(interestId: "4", interestName: "Beauty", interestImagePath: ""),
  Interest(interestId: "5", interestName: "School", interestImagePath: ""),
  Interest(interestId: "6", interestName: "Soccer", interestImagePath: ""),
  Interest(interestId: "7", interestName: "Movies", interestImagePath: ""),
  Interest(interestId: "8", interestName: "Driving", interestImagePath: ""),
];