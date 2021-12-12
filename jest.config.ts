import type { Config } from '@jest/types';

const PERCENT_COVERAGE = 85;

const config: Config.InitialOptions = {
  verbose: true,
  preset: 'ts-jest',
  testEnvironment: 'node',
  modulePaths: ['<rootDir>/src'],
  modulePathIgnorePatterns: ['<rootDir>/dist'],
  coverageThreshold: {
    global: {
      branches: PERCENT_COVERAGE,
      functions: PERCENT_COVERAGE,
      lines: PERCENT_COVERAGE,
      statements: PERCENT_COVERAGE,
    }
  }
};

export default config;
