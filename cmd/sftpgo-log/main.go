// Package main ...
package main

import (
	"github.com/jc21/sftpgo-log/internal/config"
	"github.com/jc21/sftpgo-log/internal/printer"
	"github.com/jc21/sftpgo-log/internal/reader"
)

func main() {
	config.GetConfig()
	printer.Configure()
	reader.Read()
}
