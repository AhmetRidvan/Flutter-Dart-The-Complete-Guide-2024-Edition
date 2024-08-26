class UrunlerModel {
  List<Urun> urunler;
  List<kategoriler> kategoriler1;

  UrunlerModel(this.urunler, this.kategoriler1);

  factory UrunlerModel.fromJson(Map<String, dynamic> data) {
    final List jsonUrunler = data["urunler"];
    final List jsonKategory = data["kategoriler"];

    return UrunlerModel(
        jsonUrunler.map(
          (e) {
            return Urun.fromjson(e);
          },
        ).toList(),
        jsonKategory.map(
          (e) {
            return kategoriler.fromJson(e);
          },
        ).toList());
  }
}

class Urun {
  int id;
  int kategory;
  String isim;
  String resim;

  Urun(this.id, this.kategory, this.isim,
      this.resim); //dışardan bir json alıp ürüne çeviriyoruz

  factory Urun.fromjson(Map<String, dynamic> json) {
    return Urun(json["id"], json["kategori"], json["isim"], json["resim"]);
  }
}

class kategoriler {
  int id;
  String isim;

  kategoriler(this.id, this.isim);

  factory kategoriler.fromJson(Map<String, dynamic> data) {
    return kategoriler(data["id"], data["isim"]);
  }
}
