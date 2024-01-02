class RegexPatterns {
  String password = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';

  String email =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}"
      r'[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$';

  String phoneNumber =
      r'\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2'
      r'[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|'
      r'4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$';
}

final regexPatterns = RegexPatterns();
