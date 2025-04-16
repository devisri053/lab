const { Builder, By, Key } = require("selenium-webdriver");

    (async function testgoogleSearch() {
    
        let driver = await new Builder().forBrowser("chrome").build();
        
        try 
        {
        
            await driver.get("http://www.google.com");
            

            
            await driver.findElement(By.name("q")).sendKeys("Selenium wutomation", Key.RETURN);
            
            //salt) seconds
            
            await driver.sleep(3000);
        }
        
        finally
        {
            await driver.quit();
        }
    })();