*** Settings ***
Library   SeleniumLibrary
Library   String
resource   ./resources/resources.robot
test setup   open Homepage
test teardown   close Homepage
*** Variables ***
@{dataArrays}   1   2   3   4   5   6   7

*** Test Cases ***

AP001 Verificar que la previsualizacion esta funcionando correctamente a traves del icono del ojo
    [tags]  primercaso
    IF   ${width} >= 900
        Set Window Size     1150     800
    END
    FOR   ${data}   IN   @{dataArrays}
        wait until element is visible   xpath=//*[@id="homefeatured"]/li[${data}]/div/div[2]/h5/a
        ${textTitle}=   get text   xpath=//*[@id="homefeatured"]/li[${data}]/div/div[2]/h5/a
        click element   xpath=//*[@id="homefeatured"]/li[${data}]/div/div[1]/div/div[1]/a/i
        select frame   xpath=/html/body/div[2]/div/div/div/div/iframe
        wait until element is visible   xpath=//*[@id="product"]/div/div/div[2]/h1
        Element Text Should Be   xpath=//*[@id="product"]/div/div/div[2]/h1     ${textTitle}
        unselect frame
        click element   xpath=//*[@id="index"]/div[2]/div/div/a
    END



AP002 Verificar que la previsualizacion esta funcionando correctamente a traves del texto de preview
    [tags]  segundocaso
    IF   ${width} <= 1200
        set Window Size     1250   800
    END
    FOR     ${data}     IN  @{dataArrays}
        wait until element is visible   xpath=//*[@id="homefeatured"]/li[${data}]/div/div[2]/h5/a
        ${textTitle}    get text    xpath=//*[@id="homefeatured"]/li[${data}]/div/div[2]/h5/a
        Mouse Over   xpath=//*[@id="homefeatured"]/li[${data}]/div/div[1]/div/a[1]/img
        click element   xpath=//*[@id="homefeatured"]/li[${data}]/div/div[1]/div/a[2]
        select frame    xpath=/html/body/div[2]/div/div/div/div/iframe
        wait until element is visible   xpath=//*[@id="product"]/div/div/div[2]/h1
        Element Text Should Be   xpath=//*[@id="product"]/div/div/div[2]/h1     ${textTitle}
        unselect frame
        click element   xpath=//*[@id="index"]/div[2]/div/div/a
    END