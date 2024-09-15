class UserModel {
  final String? nama;
  final String? email;
  final String? noHp;
  final String? tanggalLahir;
  final String? selecteGender;
  final String? selectedPendidikan;
  final String? selectedStatus;
  final String? nik;
  final String? alamatKTP;
  final String? provinsi;
  final String? kota;
  final String? kecamatan;
  final String? kelurahan;
  final String? kodePos;
  final String? namaPerusahaan;
  final String? alamatPerusahaan;
  final String? jabatan;
  final String? durasiKerja;
  final String? sumberPendapatan;
  final String? pendapatanKotor;
  final String? namaBank;
  final String? cabangBank;
  final String? norek;
  final String? namaRek;

  UserModel(
      this.nama,
      this.email,
      this.noHp,
      this.tanggalLahir,
      this.selecteGender,
      this.selectedPendidikan,
      this.selectedStatus,
      this.nik,
      this.alamatKTP,
      this.provinsi,
      this.kota,
      this.kecamatan,
      this.kelurahan,
      this.kodePos,
      this.namaPerusahaan,
      this.alamatPerusahaan,
      this.jabatan,
      this.durasiKerja,
      this.sumberPendapatan,
      this.pendapatanKotor,
      this.namaBank,
      this.cabangBank,
      this.norek,
      this.namaRek);
  factory UserModel.fromJson(data) {
    return UserModel(
        data["name"],
        data["email"],
        data["nohp"],
        data["ttl"],
        data["gender"],
        data["pendidikan"],
        data["status"],
        data["nik"],
        data["alamat"],
        data["provinsi"],
        data["kota"],
        data["kecamatan"],
        data["kelurahan"],
        data["kode_pos"],
        data["nama_per"],
        data["alamat_per"],
        data["jabatan"],
        data["durasi"],
        data["sumber"],
        data["nominal_pendapatan"],
        data["nama_bank"],
        data["cabang_bank"],
        data["norek"],
        data["nama_norek"]);
  }
  Map<String, Object> toMap() {
    return {
      'id': 0,
      'name': nama ?? "",
      'alamat': alamatKTP ?? "",
      'email': email ?? "",
      'nohp': noHp ?? "",
      'ttl': tanggalLahir ?? "",
      'gender': selecteGender ?? "",
      'pendidikan': selectedPendidikan ?? "",
      'status': selectedStatus ?? "",
      'nik': nik ?? "",
      'provinsi': provinsi ?? "",
      'kota': kota ?? "",
      'kecamatan': kecamatan ?? "",
      'kelurahan': kelurahan ?? "",
      'kode_pos': kodePos ?? "",
      'nama_per': namaPerusahaan ?? "",
      'alamat_per': alamatPerusahaan ?? "",
      'jabatan': jabatan ?? "",
      'durasi': durasiKerja ?? "",
      'sumber': sumberPendapatan ?? "",
      'nominal_pendapatan': pendapatanKotor ?? "",
      'nama_bank': namaBank ?? "",
      'cabang_bank': cabangBank ?? "",
      'norek': norek ?? "",
      'nama_norek': namaRek ?? "",
    };
  }
}
