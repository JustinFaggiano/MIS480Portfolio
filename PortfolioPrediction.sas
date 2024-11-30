proc logistic data=work.query(where=(X1PAR1EDU >= 0 and 
                                     X1PAR2EDU >= 0 and 
                                     X1FAMINCOME >= 0 and 
                                     X1REGION >= 0 and 
                                     S2ANYAP >= 0 and 
                                     S4MAJMAINRSN >= 0)) descending;
    class X1PAR1EDU X1PAR2EDU X1FAMINCOME X1REGION S2ANYAP S4MAJMAINRSN/ param=ref;
    model X4RFDGMJSTEM(event='1') = X1PAR1EDU X1PAR2EDU X1FAMINCOME X1REGION S2ANYAP S4MAJMAINRSN;
    output out=predicted_values p=predicted_probability;
run;

proc print data=predicted_values;
    var X4RFDGMJSTEM predicted_probability;
run;