

extension ZDList on List{

  /*
  *   是否包含子数组
  * */
  bool isContains(List _subList) {
    for (var value in _subList) {
      if (this.contains(value) == false) {
        return false;
      }
    }
    return true;
  }
}
