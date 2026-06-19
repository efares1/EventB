This repositoty contains the development of Event-B cases studies through the application of patterns.

## Generation Process

The development follows the workflow below:

```text
Pattern DSL (.rpt)
        │
        ▼
Pattern Instantiation
        │
        ▼
Automatic Transformation
        │
        ▼
Generated Event-B Machine (.mch)
        │
        ▼
Rodin Proof Obligation Generation
        │
        ▼
Proof Verification
```

The `.rpt` files represent the high-level specification of a pattern application, while the corresponding `.mch` files represent the generated Event-B refinements obtained after applying the transformation rules.

