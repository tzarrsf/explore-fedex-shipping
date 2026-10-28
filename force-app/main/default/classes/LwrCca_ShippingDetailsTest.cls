/**
 * @description       : This code... [Fill in the rest!]
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Delivery Success (2024)
 * @last modified on  : 05-12-2026
 * @last modified by  : Tom Zarr
 **/
@isTest
public class LwrCca_ShippingDetailsTest {
  @testSetup
  static void setup() {
    Account account = new Account(Name = 'TestAccount');
    insert account;
    WebStore webStore = new WebStore(
      Name = 'B2B Store',
      SupportedLanguages = 'en_US',
      DefaultLanguage = 'en_US'
    );
    insert webStore;
    WebCart cart = new WebCart(
      Name = 'Cart',
      WebStoreId = webStore.Id,
      AccountId = account.Id
    );
    insert cart;
  }

  @isTest
  public static void getMetaDataDTOTest() {
    WebStore store = [
      SELECT id, Name
      FROM WebStore
      WHERE Name = 'B2B Store'
      LIMIT 1
    ];
    Test.startTest();
    List<LwrCca_ShippingMetaData> result = LwrCca_ShippingDetails.getMetaDataDTO(
      store.Id
    );
    Test.stopTest();

    // Assertions
    System.assertEquals(result[0].maxPackageWeight, null);
    System.assertEquals(result[0].minPackageWeight, null);
    System.assertEquals(result[0].accountNumber, null);
    System.assertEquals(result[0].endPoint, null);
    System.assertEquals(result[0].httpMethod, 'POST');
    System.assertEquals(result[0].shippingMethodNames, null);
    System.assertEquals(result[0].serviceTimeout, null);
    System.assertEquals(result[0].requestJSON, null);
    System.assertEquals(
      result[0].providerImplClass,
      'LwrCca_ShippingInternalProvider'
    );
    System.assertEquals(result[0].mockedResponse, null);
    System.assertEquals(result[0].serviceImplClass, null);
    System.assertEquals(result[0].namedCredentials, null);
  }

  public static Shipping_Provider__mdt getCustomMetadataRecord() {
    Shipping_Provider__mdt testShipProvider = new Shipping_Provider__mdt(
      Context_Name__c = 'Training',
      Context_Locale__c = 'en_US',
      Impl_Class__c = 'LwrCca_ShippingInternalProvider'
    );
    return testShipProvider;
  }

  @isTest
  public static void getMetaDataObjectTest() {
    Test.startTest();
    Object result = LwrCca_ShippingDetails.getMetaDataObject();
    Test.stopTest();
    System.assertEquals(result, null);
  }
}
