REBAR=rebar

DIALYZER=dialyzer
DIALYZER_OPTS=-Wno_return -Wrace_conditions -Wunderspecs -Wno_undefined_callbacks --fullpath

.PHONY: all clean compile console dialyze doc test

all: compile

clean:
	@$(REBAR) clean

compile:
	@$(REBAR) compile

doc:
	@$(REBAR) doc

test:
	@$(REBAR) eunit skip_deps=true

dialyze: compile
	@$(DIALYZER) $(DIALYZER_OPTS) -r ./ebin

deploy:
	@git tag `grep -E -o '[0-9]\.[0-9]\.[0-9]{1,2}' src/iptables.app.src`
	@git push --tags origin master

