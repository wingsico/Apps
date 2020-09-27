enum AuthType {
  Anonymous, // 0
  Normal, // 1
  Admin, // 2
}

extension AuthTypeExtension on AuthType {
  bool checkAuth(List<AuthType> auths) {
    if (auths == null || auths?.length == 0) {
      return true;
    }

    if (auths.length == 1) {
      print(auths[0].index <= this.index);
      return auths[0].index <= this.index;
    }

    return auths.contains(this);
  }

  String get name => getPropName(this);
}

String getPropName(Object enumEntity) {
  final fullName = enumEntity.toString();
  final indexOfDot = fullName.indexOf('.');
  assert(indexOfDot > -1 && indexOfDot < fullName.length,
      "Illegal enumeration value: $enumEntity");
  return fullName.substring(indexOfDot + 1);
}
