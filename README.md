# Invariant Definition Language

Exploration in using [antlr4](https://github.com/antlr/antlr4) for
defining the invariant definition language.

Very useful tool: http://lab.antlr.org/

The goal would be that one can express simple invariants about
timing, ordering in a SQL like language and our tool would
automatically generate from a small textfile the whole
flink-cep code + monitoring etc.

To test the grammer do the following:

1. install antlr4 

2. In this folder run
> antlr4 invariants.g4 && javac invariants*.java

3. test the parser
> java org.antlr.v4.runtime.misc.TestRig invariants invariant -gui invariant-1.txt

We have to think about whether we expect the user to specify invariants that
describe the valid behaviour then we would have to negate that invariant and match all
deviating events, or if the user specifies the incorrect behaviour directly.

### Time window invariants
```
EVENTS (ORDER_SUBMITTED os, PAYMENT_SUCCESSFUL ps, PAYMENT_FAILED pf)
WHERE os.order_id = ps.order_ID OR os.order_id = pf.order_id
WITHIN 5 seconds
```

### Ordering invariants (value based)
```
EVENTS (ORDER_SUBMITTED os, PAYMENT_SUCCESSFUL ps)
WHERE os.order_id = ps.order_ID
ORDERING < os, ps >
WINDOW 5 minutes
```


### interleavings
```
EVENTS (POLICY_UPDATE pu, POLICY_CREATE pc, POLICY_DELETE pd)
WHERE pu.policy_id = pc.policy_id AND pc.policy_id = pd.policy_id
ORDERING < pu, pd, pc > OR < pc, pu, pd >
WINDOW 5 minutes
```


