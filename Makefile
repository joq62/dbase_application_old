all:
	erl -sname 10250 -boot ./dbase -config ./sys
clean:
	rm -rf  *~ */*~ */*/*~ *.beam *erl_crash*
doc_gen:
	rm -rf  node_config logfiles doc/*;
	erlc ../doc_gen.erl;
	erl -s doc_gen start -sname doc

release:
	rm -rf dbase_service/ebin/* common/ebin/* systool_script.beam;
	cp ../../infra_2/dbase_service/src/*.app dbase_service/ebin;
	erlc -o dbase_service/ebin ../../infra_2/dbase_service/src/*.erl;
	cp ../../infra_2/common/src/*.app common/ebin;
	erlc -o common/ebin ../../infra_2/common/src/*.erl;
	erlc systool_script.erl;
	erl -pa ./common/ebin -pa ./dbase_service/ebin -s systool_script start -sname systools

test:
	rm -rf  ebin/* test_ebin/* src/*~ test_src/*~ *~ erl_crash.dump src/*.beam test_src/*.beam;
	rm -rf Mnesia*;
#	common
	cp ../common/src/*app ebin;
	erlc -o ebin ../common/src/*.erl;
#	dbase
	cp ../dbase_service/src/*app ebin;
	erlc -o ebin ../dbase_service/src/*.erl;
#	iaas
	cp src/*app ebin;
	erlc -o ebin src/*.erl;
	erlc -o test_ebin test_src/*.erl;
	erl -pa ebin -pa ebin -pa test_ebin -s iaas_tests start -name 10250 -setcookie abc
