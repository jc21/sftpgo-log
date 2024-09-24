// Package config ...
package config

import (
	"github.com/jc21/sftpgo-log/internal/model"

	"github.com/JeremyLoy/config"
	"github.com/alexflint/go-arg"
)

// Populated at build time using ldflags
var appArguments model.ArgConfig
var isLoaded bool

// GetConfig returns the ArgConfig
func GetConfig() model.ArgConfig {
	if isLoaded {
		return appArguments
	}

	err := config.FromEnv().To(&appArguments)
	if err != nil {
		panic(err)
	}
	arg.MustParse(&appArguments)

	isLoaded = true
	return appArguments
}
