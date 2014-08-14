LSC = node_modules/LiveScript/bin/lsc

all: package.json

package.json: package.json.ls
	$(LSC) --compile package.json.ls
