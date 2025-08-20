import Testing

@testable import WrkstrmMain

struct StringErrorTests {
  @Test
  func descriptionMatchesMessage() {
    let message = "something went wrong"
    let error = StringError(message)
    #expect(error.message == message)
    #expect(error.description == message)
  }
}
