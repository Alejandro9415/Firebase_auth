bool isValidEmail(String text) => RegExp(
        r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(text);
    
bool isValidName(String text) => RegExp(r"^[a-zA-ZñÑ]+$").hasMatch(text);
