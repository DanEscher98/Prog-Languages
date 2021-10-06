import latextools
import random

numbers = [[random.randint(0, 10000) for x in range(4)]
          for y in range(5)]
row = ['&'.join('{}'.format(num) for num in row)
       for row in numbers]
table_body = ' \\\\\n\\hline\n    '.join(row)

pdf = latextools.render_snippet(r'''
\begin{tabular}{c|c|c|c}
    A & B & C & E \\
    \hline\hline
    ''' + table_body + ''' \\
\end{tabular}
'''.strip(),
    pad=1,
)
pdf.save('table.pdf')
pdf.rasterize('table.png', scale=2)
pdf.as_svg().as_drawing(scale=2).saveSvg('table.svg')
pdf  # Show preview if this is in a Jupyter notebook