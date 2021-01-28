//
//  PostDetailPresenterTests.swift
//  TestTaskTests
//
//  Created by Денис Щиголев on 28.01.2021.
//

import XCTest
@testable import TestTask

class MockView: PostDetailViewProtocol {
    
}

class PostDetailModuleTests: XCTestCase {
    
    var view: MockView!
    var presenter: PostDetailPresenterProtocol!
    var item: Item!
    
    override func setUpWithError() throws {
        view = MockView()
        item = Item(id: "Baz",
                    type: .plain,
                    contents: [Content(data: ContentData(value: nil,
                                                         extraSmall: nil,
                                                         small: nil,
                                                         medium: nil,
                                                         original: nil,
                                                         values: nil),
                                       type: .image,
                                       id: "Bar"),
                               Content(data: ContentData(value: "Some text in tests",
                                                         extraSmall: nil,
                                                         small: nil,
                                                         medium: nil,
                                                         original: nil,
                                                         values: nil),
                                       type: .text,
                                       id: nil),
                               Content(data: ContentData(value: nil,
                                                         extraSmall: nil,
                                                         small: nil,
                                                         medium: nil,
                                                         original: nil,
                                                         values: ["Baz", "Bar", "Foo"]),
                                       type: .tags,
                                       id: nil)],
                    createdAt: 2020,
                    author: Author(id: "Baz",
                                   name: "Bar",
                                   banner: nil,
                                   photo: nil,
                                   gender: .male,
                                   isHidden: false,
                                   isBlocked: false,
                                   isMessagingAllowed: false,
                                   auth: Auth(isDisabled: nil,
                                              level: nil,
                                              lastSeenAt: nil),
                                   statistics: Statistics(likes: 0,
                                                          thanks: 0,
                                                          uniqueName: false,
                                                          thanksNextLevel: nil),
                                   tagline: "Foo",
                                   data: AuthorData()),
                    isCommentable: false,
                    hasAdultContent: false,
                    isAuthorHidden: false,
                    isHiddenInProfile: false,
                    language: .en,
                    awards: Awards(voices: 0, awardedByMe: false),
                    status: .published,
                    stats: Stats(likes: Comments(count: 0, my: false),
                                 views: Comments(count: 0, my: false),
                                 comments: Comments(count: 0, my: false),
                                 shares: Comments(count: 0, my: false),
                                 replies: Comments(count: 0, my: false),
                                 timeLeftToSpace: TimeLeftToSpace(my: false)),
                    isMyFavorite: false)
        presenter = PostDetailPresenter(view: view, selectedItem: item)
        
    }
    
    override func tearDownWithError() throws {
        view = nil
        item = nil
        presenter = nil
    }
    
    func testDetailModuleIsNotNil() {
        XCTAssertNotNil(view, "View is not nil")
        XCTAssertNotNil(item, "Item is not nil")
        XCTAssertNotNil(presenter, "Presenter is not nil")
    }
    
    func testItemModel() {
        XCTAssertEqual(item.author?.name, "Bar")
        XCTAssertEqual(item.contents.count, 3)
        XCTAssertEqual(item.contents[1].data.value, "Some text in tests")
        XCTAssertEqual(item.contents.first?.data.original?.url, nil)
    }
    
    func testPresenter() {
        XCTAssertEqual(presenter.authorName, "Bar")
        XCTAssertEqual(presenter.postTags, "Baz, Bar, Foo")
        XCTAssertEqual(presenter.postText, "Some text in tests")
        XCTAssertEqual(presenter.postImage, nil)
    }
    
}
