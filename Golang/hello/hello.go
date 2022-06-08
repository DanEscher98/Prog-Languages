package main

import (
	"os"
	"fmt"
	"path"
	"rsc.io/quote"
	"github.com/akamensky/argparse"
	"example.com/greetings"
)


func main() {
	parser  := argparse.NewParser("pathSep", "Separe a path in his sections")
	p 		:= parser.String("p", "path", &argparse.Options{Required: true, Help: "The path"})
	err		:= parser.Parse(os.Args)
	if err != nil {
		fmt.Print(parser.Usage(err))
	}
	_, file := path.Split(*p)
	fmt.Println(quote.Go())
	fmt.Println(greetings.Hello("Dany"))
	fmt.Println("file: ", file)
}
