module.exports = {
  extends: ['airbnb'],
  rules: {
    indent: ['error', 2, {
      MemberExpression: 0, // indent the multi-line property chains with 0 spaces
    }],
    'require-jsdoc': ['warn', {
      require: {
        FunctionDeclaration: true,
        MethodDefinition: true,
        ClassDeclaration: true,
        ArrowFunctionExpression: true,
        FunctionExpression: true,
      }
    }],
    'valid-jsdoc': ['warn'],
  },
};
