export default () => ({
  port: parseInt(process.env.PORT || '3030'),

  // database: {
  //   port: 5432,
  //   host: process.env.DB_HOST,
  //   username: process.env.DB_USER,
  //   password: process.env.DB_PASS,
  //   database: process.env.DB_NAME,
  // },

  get typeorm() {
    const typeOrmConfig = {
      type: 'postgres',
      synchronize: false,
      logging: false,
      entities: ['src/**/*.entity{.ts,.js}'],
      migrations: ['src/migration/*{.ts,.js}'],
      autoLoadEntities: true,
      cli: {
        entitiesDir: 'src/**/*.entity{.ts,.js}',
        migrationsDir: 'src/migration',
      },
    };

    return {
      ...typeOrmConfig,
      ...this.database,
    };
  },
});
