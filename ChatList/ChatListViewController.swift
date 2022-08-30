//
//  ChatListViewController.swift
//  ChatList
//
//  Created by 백소망 on 2022/08/30.
//

import UIKit

class ChatListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var chatList : [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Data, presentation, Layout
        
        collectionView.dataSource = self    // 데이터 내가 알려줄게
        collectionView.delegate = self      // 레이아웃 관리 내가 할게
        
        chatList = chatList.sorted(by: { chat1, chat2 in
            return chat1.date > chat2.date
        })
    }
}

extension ChatListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
    }
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
