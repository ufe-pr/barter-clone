extension CharacterValidation on String {
  bool containsUpper() {
    for (var i = 0; i < this.length; i++) {
      var code = this.codeUnitAt(i);
      if (code >= 65 && code <= 90) return true;
    }
    return false;
  }

  bool containsLower() {
    for (var i = 0; i < this.length; i++) {
      var code = this.codeUnitAt(i);
      if (code >= 97 && code <= 122) return true;
    }
    return false;
  }

  bool containsSpecialChar() {
    for (var i = 0; i < this.length; i++) {
      var code = this.codeUnitAt(i);
      if (code >= 33 && code <= 47) return true;
    }
    return false;
  }

  bool containsNumber() {
    for (var i = 0; i < this.length; i++) {
      var code = this.codeUnitAt(i);
      if (code >= 48 && code <= 57) return true;
    }
    return false;
  }
}
