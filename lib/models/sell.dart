class Sell {
  Sell(this.rName, this.contact, this.address, this.fDetails, this.sell,
      this.time);
  final String rName;
  final String contact;
  final String address;
  final String fDetails;
  final String sell;
  final String time;

  Map<String, String> toMap() => {
        "Restaurant Name": rName,
        "Contact No.": contact,
        "Restaurant Address": address,
        "Food Details": fDetails,
        "Selling Price": sell,
        "time": time,
      };
}
