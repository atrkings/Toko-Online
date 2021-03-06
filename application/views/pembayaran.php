<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
            <div class="col-md-8">
                <div class="btn btn-sm btn-success">
                    <?php
                        $grand_total =0;
                        if ($keranjang = $this->cart->contents()) 
                        {
                            foreach ($keranjang as $item)
                            {
                                $grand_total = $grand_total + $item['subtotal'];
                            }

                        echo "<h5>Total Belanja Anda: Rp. " .number_format($grand_total,0,',','.');
                    ?>
                </div><br><br>

                <h3>Input Alamat Pengiriman dan Pembayaran</h3>

                <form method="post" action="<?=base_url()?>dashboard/proses_pesanan">

                        <div class="form-group">
                            <label>Nama Lengkap</label>
                            <input type="text" name="nama" class="form-control" placeholder="Nama Lengkap Anda">
                        </div>

                        <div class="form-group">
                            <label>Alamat</label>
                            <input type="text" name="alamat" class="form-control" placeholder="Alamat Lengkap Anda">
                        </div>

                        <div class="form-group">
                            <label>No. Telepon</label>
                            <input type="text" name="no_telp" class="form-control" placeholder="Nomor Telepon Anda">
                        </div>

                        <div class="form-group">
                            <label>Jasa Pengiriman</label>
                                <select class="form-control">
                                    <option>----- SELECT PENGIRIMAN ----</option>
                                    <option>JNE</option>
                                    <option>J&T</option>
                                    <option>TIKI</option>
                                    <option>Pos Indonesia</option>
                                    <option>GOJEK</option>
                                    <option>GRAB</option>
                                </select>
                        </div>

                        <div class="form-group">
                            <label>Metode Pembayaran</label>
                                <select class="form-control">
                                    <option>Cash On Dilivery (COD)</option>
                                    <option>Transfer (BANK)</option>
                                </select>
                        </div>

                        <div class="form-group">
                            <label>Pilih Bank</label>
                                <select class="form-control" name="kategori">
                                    <option>----- SELECT BANK ----</option>
                                    <option?>BCA - xxxxxxx</option>
                                    <option>BNI - xxxxxxx</option>
                                    <option>BRI - xxxxxxx</option>
                                    <option>MANDIRI - xxxxxxx</option>
                                </select>
                        </div>

                        <button type="submit" class="btn btn-sm btn-primary mb-3">Pesan</button>
                </form>
            </div>
                    <?php
                        }

                        else

                        {
                            echo "<h5>Keranjang Belanja Anda Kosong";
                        }

                    ?>

        <div class="col-md-2">
        </div>
    </div>
</div>