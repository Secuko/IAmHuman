class Constants {
  static String passwordRegex = r"(?=.*[0-9])(?=.*[a-z]).{8,}$";
  static String emailRegex = r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$";
  static String nameRegex = r"^(([a-zA-Zа-яА-ЯёЁ]+\s){0,})+[a-zA-Zа-яА-ЯёЁ]+$";
}
