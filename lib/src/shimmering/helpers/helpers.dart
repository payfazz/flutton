mixin FluttonShimmeringHelpers {
  Function determineValueByComparasion<T, TT>(T a, TT b) {
    return <T, TT>(T val1, TT val2) => a == b ? val1 : val2;
  }
}
