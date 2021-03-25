--17
select cb.SBDEN N'san bay den', count(cb.MACB) N'so chuyen bay ha canh'
from CHUYENBAY cb
group by SBDEN
order by SBDEN
--18
select cb.SBDI N'san bay di', count(cb.MACB) N'so chuyen bay xuat phat'
from CHUYENBAY cb
group by SBDEN
order by SBDEN
--19
select SBDI 'san bay di', lb.NGAYDI 'ngay', count(lb.MACB) 'so luong'
from CHUYENBAY cb join LICHBAY lb
	on cb.MACB = lb.MACB
group by NGAYDI, SBDI
--20
select SBDEN 'san bay den', lb.NGAYDI 'ngay', count(lb.MACB) 'so luong'
from CHUYENBAY cb join LICHBAY lb
	on cb.MACB = lb.MACB
group by NGAYDI, SBDEN
--21
select lb.MACB 'ma chuyen bay', lb.NGAYDI 'ngay di', count(nv.MANV) 'so luong tiep vien'
from NHANVIEN nv join PHANCONG pc on nv.MANV = pc.MANV and nv.LOAINV <> 1 join LICHBAY lb on lb.MACB = pc.MACB and lb.NGAYDI = pc.NGAYDI
group by lb.MACB, lb.NGAYDI
--22
select count(lb.MACB) 'so luong chuyen bay xuat phat tu MIA vao 11/01/2000'
from LICHBAY lb join CHUYENBAY cb on lb.MACB = cb.MACB and cb.SBDI = 'MIA' and lb.NGAYDI = '2000-11-01'
--23
select lb.MACB 'ma chuyen bay', lb.NGAYDI 'ngay di', count(nv.MANV) 'so luong nhan vien'
from NHANVIEN nv join PHANCONG pc on nv.MANV = pc.MANV join LICHBAY lb on lb.MACB = pc.MACB and lb.NGAYDI = pc.NGAYDI
group by lb.MACB, lb.NGAYDI
order by count(nv.MANV)
--24
select lb.MACB 'ma chuyen bay', lb.NGAYDI 'ngay di', count(kh.MAKH) 'so luong hanh khach'
from KHACHHANG kh join DATCHO dc on kh.MAKH = dc.MAKH join LICHBAY lb on dc.MACB = lb.MACB and dc.NGAYDI = lb.NGAYDI
group by lb.MACB, lb.NGAYDI
order by count(kh.MAKH) desc
--25
select lb.MACB 'ma chuyen bay', lb.NGAYDI 'ngay di', sum(nv.LUONG) 'tong luong phi hanh doan'
from NHANVIEN nv join PHANCONG pc on nv.MANV = pc.MANV join LICHBAY lb on lb.MACB = pc.MACB and lb.NGAYDI = pc.NGAYDI
group by lb.MACB, lb.NGAYDI
order by sum(nv.luong)
--26
select AVG(LUONG) 'luong trung binh tiep vien'
from NHANVIEN nv
where nv.LOAINV <> 1
--27
select AVG(LUONG) 'trung binh luong phi cong'
from NHANVIEN nv
where nv.LOAINV = 1
--28
select mb.MALOAI 'ma loai', count(lb.MACB) 'so luong chuyen bay'
from MAYBAY mb join LICHBAY lb on  mb.MALOAI = lb.MALOAI join CHUYENBAY cb on cb.MACB = lb.MACB and cb.SBDEN = 'ORD'
group by mb.MALOAI
--29
select cb.SBDI 'san bay di', count(lb.MACB) 'so luong'
from LICHBAY lb join CHUYENBAY cb on lb.MACB = cb.MACB and DATEPART(HOUR, cb.GIODI) >= 10 and DATEPART(HOUR, cb.GIODI) <= 22
group by cb.SBDI
having count(lb.MACB) > 2
--30
select nv.TEN 'ten phi cong', count(pc.MACB) 'so chuyen bay', NGAYDI 'ngay di'
from NHANVIEN nv join PHANCONG pc on nv.MANV = pc.MANV and nv.LOAINV = 1
group by pc.MANV, pc.NGAYDI, nv.TEN
having count(pc.MACB) > 1
--31
select lb.MACB 'ma chuyen bay', lb.NGAYDI 'ngay di', count(kh.MAKH) 'so hanh khach'
from KHACHHANG kh join DATCHO dc on kh.MAKH = dc.MAKH join LICHBAY lb on dc.MACB = lb.MACB and dc.NGAYDI = lb.NGAYDI
group by lb.MACB, lb.NGAYDI
having count(kh.MAKH) < 3
--32
select lb.SOHIEU 'so hieu', lb.MALOAI 'ma loai', count(lb.MACB) 'so lan duoc phan cong'
from NHANVIEN nv join PHANCONG pc on nv.MANV = pc.MANV and nv.MANV = '1001' join LICHBAY lb on pc.MACB = lb.MACB and pc.NGAYDI = lb.NGAYDI
group by SOHIEU, MALOAI
having count(lb.MACB) > 2
--33
select HANGSX 'hang san xuat', count(MALOAI) 'so luong loai may bay'
from LOAIMB
group by HANGSX