select gv.* from
(select max(NGSINH) ns, PHAI
from GIAOVIEN gv
group by PHAI) gvtre join GIAOVIEN gv on gvtre.ns = gv.NGSINH and gvtre.PHAI = gv.PHAI