package com.mitrais.rms.dao;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import javax.sql.DataSource;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * This class provides MySQL datasource to be used to connect to database.
 * It implements singleton pattern See <a href="http://www.oodesign.com/singleton-pattern.html">Singleton Pattern</a>
 */
public class DataSourceFactory
{
    private final DataSource dataSource;

    DataSourceFactory()
    {
        MysqlDataSource dataSource = new MysqlDataSource();
        // TODO: make these database setting configurable by moving to properties file
        
        try {
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream("database.properties");
			Properties appProps = new Properties();
	        appProps.load(inputStream);
	        
//	        dataSource.setDatabaseName("rmsdb");
//	        dataSource.setServerName("192.168.99.100");
//	        dataSource.setPort(3306);
//	        dataSource.setUser("rms");
//	        dataSource.setPassword("rms");
	        
	        dataSource.setDatabaseName(appProps.getProperty("databaseName"));
	        dataSource.setServerName(appProps.getProperty("serverName"));
	        dataSource.setPort(Integer.parseInt(appProps.getProperty("port")));
	        dataSource.setUser(appProps.getProperty("user"));
	        dataSource.setPassword(appProps.getProperty("password"));
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        this.dataSource = dataSource;      
        
    }

    /**
     * Get a data source to database
     *
     * @return DataSource object
     */
    public static Connection getConnection() throws SQLException
    {
        return SingletonHelper.INSTANCE.dataSource.getConnection();
    }

    private static class SingletonHelper
    {
        private static final DataSourceFactory INSTANCE = new DataSourceFactory();
    }
}
