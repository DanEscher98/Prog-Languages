package main

import (
	"fmt"
	"math/rand"
)

type Node struct {
	value int
	next  *Node
}

type List struct {
	length int
	start  *Node
}

func (l *List) display() {
	currentNode := l.start
	for currentNode != nil {
		fmt.Printf("%v", currentNode.value)
		if currentNode.next != nil {
			fmt.Printf(" -> ")
		} else {
			fmt.Println()
		}
		currentNode = currentNode.next
	}
}

func (l *List) insertNode(newNode *Node) {
	if l.length == 0 {
		l.start = newNode
	} else {
		currentNode := l.start
		for currentNode.next != nil {
			currentNode = currentNode.next
		}
		currentNode.next = newNode
	}
	l.length++
}

func (l *List) deleteNode(index int) {
	head := l.start
	precedent := head
	for i := 0; i < index; i++ {
		precedent = head
		head = head.next
	}
	precedent.next = head.next
	l.length--
}

func main() {
	myList := List{}
	size := 10
	for i := 0; i < size; i++ {
		node := Node{
			value: rand.Intn(1000)}
		myList.insertNode(&node)
	}
	myList.display()
	myList.deleteNode(0)
	myList.display()
}
