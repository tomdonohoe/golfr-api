import AppConfig from './app.config';

describe('ApplicationConfig', () => {
  const config = AppConfig();

  describe('when initializing...', () => {
    it('should be defined', () => {
      expect(config).toBeDefined();
    });

    it('should contain expected config properties', () => {
      expect(config.port).toBeDefined();
      expect(config.database).toBeDefined();
      expect(config.typeorm).toBeDefined();
    });
  });
});
