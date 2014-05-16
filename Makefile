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
