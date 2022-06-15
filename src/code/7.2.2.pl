numeral(N) --> n1_999(N).
numeral(N) --> n1_9(N1),[thousand],n1_999(N2),{N is N1*1000+N2}.

n1_999(N)  --> n1_99(N).
n1_999(N)  --> n1_9(N1),[hundred],n1_99(N2),{N is N1*100+N2}.

n1_99(N)   --> n0_9(N).
n1_99(N)   --> n10_19(N).
n1_99(N)   --> n20_90(N).
n1_99(N)   --> n20_90(N1),n1_9(N2),{N is N1+N2}.

n0_9(0)    --> [].
n0_9(N)    --> n1_9(N).

n1_9(1)    --> [one].
n1_9(2)    --> [two].
n1_9(3)    --> [three].
n1_9(4)    --> [four].
n1_9(5)    --> [five].
n1_9(6)    --> [six].
n1_9(7)    --> [seven].
n1_9(8)    --> [eight].
n1_9(9)    --> [nine].

n10_19(10) --> [ten].
n10_19(11) --> [eleven].
n10_19(12) --> [twelve].
n10_19(13) --> [thirteen].
n10_19(14) --> [fourteen].
n10_19(15) --> [fifteen].
n10_19(16) --> [sixteen].
n10_19(17) --> [seventeen].
n10_19(18) --> [eighteen].
n10_19(19) --> [nineteen].

n20_90(20) --> [twenty].
n20_90(30) --> [thirty].
n20_90(40) --> [fourty].
n20_90(50) --> [fifty].
n20_90(60) --> [sixty].
n20_90(70) --> [seventy].
n20_90(80) --> [eighty].
n20_90(90) --> [ninety].

/** <examples>
?- phrase(numeral(N),[nine,thousand,nine,hundred,ninety,nine]).
*/
