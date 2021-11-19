f = figure();
d = reshape(1:9, [3,3]);
row_names = {"Row1", "Row2", "Row3"};
col_names = {"Col1", "Col2", "Col3"};
t = uitable(f, "Data", d, ...
	"RowName", row_names, "ColumnName", col_names);
p = get(t, "Position");
e = get(t, "Extent");
p(3:4) = e(3:4);
set(t, "Position", p);