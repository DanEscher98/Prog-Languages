import latextools

# Build a Latex document
packages = [
    latextools.pkg.qcircuit,
    latextools.LatexPackage('geometry', ('paperheight=2.5in','paperwidth=2.5in',
                                         'margin=0.1in','heightrounded')),
]
commands = [
    latextools.cmd.ceil,
]
config = latextools.DocumentConfig('article', ('',))

proj = latextools.LatexProject()
content = latextools.BasicContent(
    r'''%
\[
\Qcircuit @R=.1em @C=0.3em @!R {
&	\qw	&	\qw	&	\ctrl{2}	&	\qw	&	\qw	&	\qw	&	\qw	&	\qw	&	\qw	\\
&	\qw	&	\qw	&	\qw	&	\qw	&	\ctrl{1}	&	\qw	&	\qw	&	\qw	&	\qw	\\
&	\push{\ket{0}}\qw	&	\qw	&	\targ	&	\targ	&	\targ	&	\targ	&	\qw	&	\meter	&	\qw	\\
&	\qw	&	\qw	&	\targ	&	\ctrl{-1}	&	\qw	&	\qw	&	\qw	&	\qw	&	\qw	\\
&	\qw	&	\qw	&	\qw	&	\targ	&	\qw	&	\ctrl{-2}	&	\qw	&	\qw	&	\qw	\\
&	\push{\ket{0}}\qw	&	\gate{H}	&	\ctrl{-2}	&	\ctrl{-1}	&	\ctrl{1}	&	\ctrl{2}	&	\gate{H}	&	\meter	&	\qw	\\
&	\qw	&	\qw	&	\qw	&	\qw	&	\targ	&	\qw	&	\qw	&	\qw	&	\qw	\\
&	\qw	&	\qw	&	\qw	&	\qw	&	\qw	&	\targ	&	\qw	&	\qw	&	\qw	\\
}%
\]
''',
    packages, commands)
doc = content.as_document(path='figs/syndrome-circuit.tex',
                          config=config)
doc = latextools.LatexDocument(
    path='figs/syndrome-circuit.tex', config=config,
    contents=(
        latextools.BasicContent('\centering A qcircuit diagram:'),
        content,
    ))
proj.add_file(doc)

# Write Latex source code to current directory (maintains directory structure)
proj.write_src('.')

# Render Latex
proj.add_file(latextools.LatexDocument(
    path='main.tex', config=config, contents=doc.contents))
pdf = proj.compile_pdf()
# With additional command line arguments:
#pdf = proj.compile_pdf(options=['-halt-on-error', '-file-line-error',
#                                '-interaction', 'nonstopmode', '-shell-escape'])

pdf.save('figs/syndrome-circuit.pdf')