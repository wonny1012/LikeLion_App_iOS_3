//
//  AttractionTableTableViewController.swift
//  TableViewStory
//
//  Created by kwon ji won on 11/16/23.
//

import UIKit

//찾아주면 바로 받아와 + 자료검색할 수 있는거
class AttractionTableTableViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    //테이블 목록
    var items = ["kim", "lee", "park"]
    var attractionImages = [String]()
    var attractionNames = [String]()
    var webAddresses = [String]()
    
    //  UISearchController 인스턴스 및 일치하는 검색 결과가 저장될 배열 추가
    var searching = false
    var matches = [Int]()
    var searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        //버튼 활성화
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        initialize()
    }
    
    // 테이블 뷰 데이터 소스 생성
    // 앱이 로드 될 때 일부 데이터로 배열을 초기화
    func initialize() {
        attractionNames = ["Buckingham Palace",
                                  "The Eiffel Tower",
                                  "The Grand Canyon",
                                  "Windsor Castle",
                                  "Empire State Building"]

               webAddresses = ["https://en.wikipedia.org/wiki/Buckingham_Palace",
                               "https://en.wikipedia.org/wiki/Eiffel_Tower",
                               "https://en.wikipedia.org/wiki/Grand_Canyon",
                               "https://en.wikipedia.org/wiki/Windsor_Castle",
                               "https://en.wikipedia.org/wiki/Empire_State_Building"]

               attractionImages = ["buckingham_palace.jpg",
                                   "eiffel_tower.jpg",
                                   "grand_canyon.jpg",
                                   "windsor_castle.jpg",
                                   "empire_state_building.jpg"]

               // 테이블 뷰의 예상 행 높이 설정
               // 테이블 보기 탐색을 추가할 때 행 높이가 축소되는 것을 방지하고, 테이블 렌더링 성능도 향상
               self.tableView.estimatedRowHeight = 50
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 검색 초기화 (self : 여기다 넣을꺼야?)
        // 테이블 보기 컨트롤러 인스턴스를 검색 컨트롤러에 대한 검색 창 및 결과 업데이트 위임자로 지정
        // 검색으로 인해 검색 결과 보기 컨트롤러가 모호해지는 것을 방지하기 위한 속성을 설정
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search Attractions"
        searchController.obscuresBackgroundDuringPresentation = false
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // 결과 업데이트 대리자로 지정
    // 검색 창에 입력된 텍스트가 포함된 검색 컨트롤러 개체에 대한 참조가 전달됨
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            
            for index in 0..<attractionNames.count {
                if attractionNames[index].lowercased().contains(searchText.lowercased()) {
                    matches.append(index)
                }
            }
            searching = true
        } else {
            searching = false
        }
        
        tableView.reloadData()
    }
    
    
    // 뷰가 보일 때 마다 리스트의 데이터를 다시 불러옴
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }
    
    // MARK: - Table view data source
    //테이블 안에 섹션이 1개
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //섹션별 행의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // 서칭 중이면 매칭이 된 곳에만 배열을 줘야한다.
        return searching ? matches.count : attractionNames.count
    }

    //items 값을 셀에 추가
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //withIdentifier -> 이름 바꿨으니 바꿔주기
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttractionTableCell", for: indexPath) as! AttractionTableViewCell
        
        //사용자가 현재 검색을 수행 중일 경우 matches 배열에 대한 인덱스 값에서 가져와야함
        let row = indexPath.row
        cell.attractionLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        
        cell.attractionLabel.text = searching ? attractionNames[matches[row]] : attractionNames[row]
        
        let imageName = searching ? attractionImages[matches[row]] : attractionImages[row]
        cell.attractionImage.image = UIImage(named: imageName)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    //목록 삭제
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let row = indexPath.row
            self.attractionNames.remove(at: row)
            self.attractionImages.remove(at: row)
            self.webAddresses.remove(at: row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    //Delete를 한글로 변경
    
    
    
    //목록 순서바꾸기
//    override func tabeView(_ tableView: UITableView)
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        //이동한 아이템 위치를 기록
        var row = fromIndexPath.row
        
        //이동할 아이템을 삭제
        let attractionName = self.attractionNames.remove(at: row)
        let attractionImage = self.attractionImages.remove(at: row)
        let webAddress = self.webAddresses.remove(at: row)
        
        // 삭제된 아이템을 이동할 위치로 삽입
               row = to.row
               self.attractionNames.insert(attractionName, at: row)
               self.attractionImages.insert(attractionImage, at: row)
               self.webAddresses.insert(webAddress, at: row)
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        
//        if editingStyle == .delete {
//            //Delete the row from the data source
//            
//            //삭제할 아이템 위치 기록
//            let row = indexPath.row
//            
//            if self.searching {
//                self.attractionNames.remove(at: matches[row])
//                self.attractionImages.remove(at: matches[row])
//                self.webAddresses.remove(at: matches[row])
//                self.matches.remove(at: row)
//                self.updateSearchResults(for: searchController)
//            } else {
//                self.attractionNames.remove(at: row)
//                self.attractionImages.remove(at: row)
//                self.webAddresses.remove(at: row)
//            }
//            
//            tableView.deleteRows(at: [IndexPath], with: .fade)
//        }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // segue의 전환시 어느 화면으로 이동하는 건지 구분
        if segue.identifier == "ShowAttractionDetails" {
            let detailView = segue.destination as! AttractionDetailViewController
            
            let row = self.tableView.indexPathForSelectedRow!.row
            detailView.webSite = searching ? webAddresses[matches[row]] : webAddresses[row]
        }
        
    }

}
