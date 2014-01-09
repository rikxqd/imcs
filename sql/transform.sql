select cs_cast(Volume, 'float4') from Quote_get('IBM');
select cs_iif(Volume>10, Open, Close) from Quote_get('IBM');
select cs_if(Open<Close, cs_parse('{1,2,3,4,5}', 'char'), cs_parse('{10,20,30,40,50}', 'char')) from Quote_get('IBM');
select cs_thin(Close, 1, 2) from Quote_get('IBM');
select cs_limit(Close, 1, 3) from Quote_get('IBM');
select cs_head(Close, 2) from Quote_get('IBM');
select cs_tail(Close, 2) from Quote_get('IBM');
select cs_filter(Open > Close, Day) from Quote_get('IBM');
select Quote_project(q.*, cs_filter_pos(High > Low*1.01)) from Quote_get('IBM', null, date('05-Nov-2013')) q;
select Quote_project(q.*, cs_filter_first_pos(High > Low*1.01, 3)) from Quote_get('IBM') q;
select cs_unique(Volume/200) from Quote_get('IBM');
select cs_reverse(Day) from Quote_get('IBM');
select cs_diff(Close) from Quote_get('IBM');
select cs_project(q.*) from (select Day,cs_maxof(Open,Close) from Quote_get('IBM', date('02-Nov-2013'))) q;
select cs_map(Volume, cs_top_max_pos(Close, 1)) from Quote_get('IBM');
select cs_union(ibm.Day, abb.Day) from Quote_get('ABB') as abb, Quote_get('IBM') as ibm;
create function mul2(x float) returns float as $$ begin return x*2; end; $$ language plpgsql strict immutable;
select cs_call(Close, 'mul2'::regproc) from Quote_get('IBM');
select cs_call(Close, 'sin'::regproc) from Quote_get('IBM');
select cs_to_int4_array('int4:{1,2,3,4,5}');
select cs_to_float4_array('int4:{1,2,3,4,5}');
select cs_sum(cs_from_array(array[1,2,3,4,5]));
select cs_to_bpchar_array('bpchar10:{Hello,World,!}');
select cs_from_array(array['Hello','World','!'], 10);
select cs_parse('{100.99,99.01,"$1,000,000"}', 'money');
select cs_cast(cs_parse('{100.99,99.01,1000000}', 'money') * 2, 'money');
select cs_cast('float4:{100.99,99.01,1000000}', 'money');
select cs_cast('money:{100.99,99.01,"1,000,000"}', 'float8');

