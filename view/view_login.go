package view

import (
	"net/http"

	"github.com/gin-gonic/gin"
	// "fmt"
)

func ViewLogin(c *gin.Context) {

	var csrdata map[string]interface{}

	template := "login.html"
	data := map[string]interface{}{
		"csrdata": csrdata,
	}

	c.HTML(http.StatusOK, template, data)

	return
}
