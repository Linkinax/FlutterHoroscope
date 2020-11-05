class Sign {
  String sign;
  String data = "Loading...";
  String amore = "Loading...";
  String lavoro = "Loading...";
  String generale = "Loading...";

  Sign(this.sign, this.data, this.amore, this.lavoro, this.generale);

  String getSign() {
    return this.sign;
  }

  String getData() {
    return this.data;
  }

  String getAmore() {
    return this.amore;
  }

  String getLavoro() {
    return lavoro;
  }
}
