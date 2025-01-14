package com.scale.framework.utility;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.safari.SafariDriver;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

public class BrowserFactory {

    private Logger log = LogManager.getLogger(BrowserFactory.class);
    private WebDriver driver;
    private ConfigurationReader configReader;

    public static final String URL = "";
    String destination = null;
    DesiredCapabilities caps = null;

    public WebDriver initiateDriver(String browserName) throws MalformedURLException {
        configReader = new ConfigurationReader();
        String[] path = System.getProperty("user.dir").split("/");
      //  String actualPath = "/" + path[1] + "/" + path[2];

        log.info("Opening " + browserName + "browser");
        switch (browserName.toUpperCase()){
            case "FIREFOX":
                WebDriverManager.firefoxdriver().setup();
                System.setProperty("webdriver.gecko.driver", configReader.getGeckoDriverPath());
                driver = new FirefoxDriver();
                driver.manage().window().maximize();
                break;
            case "CHROME":
                //System.setProperty("webdriver.chrome.driver", configReader.getChromeDriverPath());
                WebDriverManager.chromedriver().setup();
                //Uncomment below lines if you would like to run it in incognito mode
//                ChromeOptions option = new ChromeOptions();
//                option.addArguments("--incognito");
                ChromeOptions options = new ChromeOptions();
                options.addArguments("--no-sandbox");
                options.addArguments("--ignore-ssl-errors=yes", "--ignore-certificate-errors");
                driver = new ChromeDriver(options);
                driver.manage().window().maximize();
                break;
            case "SAFARI":
                driver = new SafariDriver();
                driver.manage().window().maximize();
                break;
            case "CHROME_HEADLESS":
                WebDriverManager.chromedriver().setup();
                ChromeOptions ChromeOptions = new ChromeOptions();
                // destination = actualPath + "/Library/Application Support/Google/Chrome/"+randomString(8);
                // copyFiles(actualPath + "/Library/Application Support/Google/Chrome/profile1",destination);
                // options.addArguments("user-data-dir=" + destination);
//                options.addArguments("user-data-dir=" + actualPath + "/Library/Application Support/Google/Chrome");
                ChromeOptions.addArguments("--no-sandbox");
                ChromeOptions.addArguments("--headless");
                ChromeOptions.addArguments("--ignore-ssl-errors=yes", "--ignore-certificate-errors");
                ChromeOptions.setExperimentalOption("useAutomationExtension", false);
                // options.addArguments("disable-infobars");
                // options.addArguments("--disable-extensions");
                // options.addArguments("--disable-gpu");
                ChromeOptions.addArguments("--disable-dev-shm-usage");
                ChromeOptions.addArguments("window-size=1920,1080");
                driver = new ChromeDriver(ChromeOptions);
                driver.manage().window().maximize();
                break;
        }

        return driver;
    }

    public WebDriver getDriver() {
        return driver;
    }

    public void launchURL(String url) {
        driver.get(url);
        log.info(url + " is launched");
    }

    public void launchURL(String url, String portalExtension) {
        driver.get(url + portalExtension);
        log.info(url + " is launched");
    }


    public static String randomString(int count) {
        String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        StringBuilder builder = new StringBuilder();
        while (count-- != 0) {
            int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
            builder.append(ALPHA_NUMERIC_STRING.charAt(character));
        }
        return builder.toString();
    }

    public static void copyFiles(String source,String destination){
        File src = new File(source);
        File dest = new File(destination);
        try {
            FileUtils.copyDirectory(src, dest);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteDirectory(){
        try {
            if (!destination.isEmpty() || !destination.equalsIgnoreCase("")) {
                    FileUtils.deleteDirectory(new File(destination));
                }
            } catch (Exception e) {
                log.info(e.getMessage());
            }
    }



    public void launchURL() {
        driver.get(configReader.getApplicationURL());
    }
}
