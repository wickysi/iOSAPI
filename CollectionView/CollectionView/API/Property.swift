//
//  Property.swift
//  CollectionView
//
//  Created by user on 11/2/21.
//

open class UICollectionView : UIScrollView, UIDataSourceTranslating {

    
    public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout)

    public init?(coder: NSCoder)

    
    open var collectionViewLayout: UICollectionViewLayout
    
    // 一起代理 UICollectionViewDelegate 和 UICollectionViewDelegateFlowLayout
    weak open var delegate: UICollectionViewDelegate?

    weak open var dataSource: UICollectionViewDataSource?

    //MARK: cell预加载
    /// 设置集合视图的预取数据源，接收即将到来的单元数据需求的通知。
    /// 分配一个符合UICollectionViewDataSourcePrefetching协议的对象，以方便单元格在不久的将来显示数据的预取。若要禁用数据预取行为，请将此属性设置为nil。
    @available(iOS 10.0, *)
    weak open var prefetchDataSource: UICollectionViewDataSourcePrefetching?

    /// 是否启用单元格数据预取
    @available(iOS 10.0, *)
    open var isPrefetchingEnabled: Bool

    //MARK: - cell拖放
    @available(iOS 11.0, *)
    weak open var dragDelegate: UICollectionViewDragDelegate?

    @available(iOS 11.0, *)
    weak open var dropDelegate: UICollectionViewDropDelegate?

    
    /*
     * 启动 or 禁用拖拽
     * You can force drags to be disabled for this collection view by setting this to NO.
     * As of iOS 15, this is true for both iPhone and iPad by default. Prior to iOS 15, it defaulted to false on iPhone.
     */
    @available(iOS 11.0, *)
    open var dragInteractionEnabled: Bool
    
    /*
     * 设置cell重排的节奏效果。当拖放cell时，触发cell重排的节奏效果。有3种：立即、快、慢。默认立即。
     * Reordering cadence affects how easily reordering occurs while dragging around a reorder-capable drop destination.
     * Default is UICollectionViewReorderingCadenceImmediate.
     */
    @available(iOS 11.0, *)
    open var reorderingCadence: UICollectionView.ReorderingCadence
    
    // 是否处于不稳定状态
    // 在拖放过程中，如果cell正在重排或者放入时的状态
    // Returns YES if the collection view is reordering or has drop placeholders.
    @available(iOS 11.0, *)
    open var hasUncommittedUpdates: Bool { get }

    //MARK: - 上下文菜单 ？
    @available(iOS 13.2, *)
    open var contextMenuInteraction: UIContextMenuInteraction? { get }
    
    
    // 背景视图
    // 放置在所有cell和装饰视图的后面，尺寸跟随collection视图的变化而变化。
    // will be automatically resized to track the size of the collection view and placed behind all cells and supplementary views.
    open var backgroundView: UIView?

    //MARK: - 注册cell和装饰视图
    // For each reuse identifier that the collection view will use, register either a class or a nib from which to instantiate a cell.
    // If a nib is registered, it must contain exactly 1 top level object which is a UICollectionViewCell.
    // If a class is registered, it will be instantiated via alloc/initWithFrame:
    open func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String)

    open func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String)

    
    open func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String)

    open func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String)

    //MARK: - 重用cell和装饰视图
    open func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell

    open func dequeueReusableSupplementaryView(ofKind elementKind: String, withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionReusableView

    //MARK: - 选择cell
    
    // 是否允许选择cell
    // These properties control whether items can be selected, and if so, whether multiple items can be simultaneously selected.
    open var allowsSelection: Bool // default is YES
    
    // 是否允许同时选择多个cell
    // 当你点击多个cell时，它们都将是选择状态
    open var allowsMultipleSelection: Bool // default is NO

    // 获取选择的cell的indexPaths数组
    open var indexPathsForSelectedItems: [IndexPath]? { get } // returns nil or an array of selected index paths

    // 代码选择指定cell
    open func selectItem(at indexPath: IndexPath?, animated: Bool, scrollPosition: UICollectionView.ScrollPosition)
    // 代码取消选择执行cell
    open func deselectItem(at indexPath: IndexPath, animated: Bool)

    
    
    //MARK: - 刷新视图数据
    
    // Note: -reloadData will discard any uncommitted updates (e.g. placeholders)
    open func reloadData() // discard the dataSource and delegate data and requery as necessary

    //MARK: - 重设布局 / 布局过渡
    
    open func setCollectionViewLayout(_ layout: UICollectionViewLayout, animated: Bool) // transition from one layout to another

    @available(iOS 7.0, *)
    open func setCollectionViewLayout(_ layout: UICollectionViewLayout, animated: Bool, completion: ((Bool) -> Void)? = nil)

    
    // 开始布局过渡交互
    @available(iOS 7.0, *)
    open func startInteractiveTransition(to layout: UICollectionViewLayout, completion: UICollectionView.LayoutInteractiveTransitionCompletion? = nil) -> UICollectionViewTransitionLayout
    
    // 完成布局过渡交互
    @available(iOS 7.0, *)
    open func finishInteractiveTransition()
    
    // 取消布局过渡
    @available(iOS 7.0, *)
    open func cancelInteractiveTransition()

    //MARK: -  获取collection view当前状态的信息
    // Information about the current state of the collection view.
    
    // 获取分段数
    open var numberOfSections: Int { get }
    // 获取指定分段的cell数
    open func numberOfItems(inSection section: Int) -> Int

    // 获取执行cell的布局属性
    open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?

    // 获取指定装饰视图的布局属性
    open func layoutAttributesForSupplementaryElement(ofKind kind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?

    // 获取指定位置的indexPath
    open func indexPathForItem(at point: CGPoint) -> IndexPath?
    
    // 获取指定cell的indexPath
    open func indexPath(for cell: UICollectionViewCell) -> IndexPath?

    // 获取指定indexPath的cell
    // Returns any existing visible or prepared cell for the index path. Returns nil when no cell exists, or if index path is out of range.
    open func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell?

    // 获取所有可见的cell数组
    open var visibleCells: [UICollectionViewCell] { get }
    
    // 获取所有可见的cell数组的indexPaths数组
    open var indexPathsForVisibleItems: [IndexPath] { get }

    // 获取指定indexPath的装饰视图
    @available(iOS 9.0, *)
    open func supplementaryView(forElementKind elementKind: String, at indexPath: IndexPath) -> UICollectionReusableView?
    
    // 获取所有可见的装饰视图数组
    @available(iOS 9.0, *)
    open func visibleSupplementaryViews(ofKind elementKind: String) -> [UICollectionReusableView]

    // 获取所有可见的装饰视图数组的indexPaths数组
    @available(iOS 9.0, *)
    open func indexPathsForVisibleSupplementaryElements(ofKind elementKind: String) -> [IndexPath]

    //MARK: - 与collection view交互
    // Interacting with the collection view.
    
    // 滚动到指定indexPath
    open func scrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool)

    //MARK: - 动态改变一组cell
    // These methods allow dynamic modification of the current set of items in the collection view
    
    // 插入一组分段
    open func insertSections(_ sections: IndexSet)
    
    // 删除一组分段
    open func deleteSections(_ sections: IndexSet)
    
    // 移动指定分段
    open func moveSection(_ section: Int, toSection newSection: Int)
    
    // 刷新一组分段
    open func reloadSections(_ sections: IndexSet)

    // 插入一组cell
    open func insertItems(at indexPaths: [IndexPath])
    
    // 删除一组cell
    open func deleteItems(at indexPaths: [IndexPath])

    // 移动指定cell
    open func moveItem(at indexPath: IndexPath, to newIndexPath: IndexPath)

    // 刷新一组cell
    open func reloadItems(at indexPaths: [IndexPath])
    
    //MARK: -

    // Reconfigures any existing cells for the items. Reconfiguring is more efficient than reloading an item, as it does not replace the
    // existing cell with a new cell. Prefer reconfiguring over reloading unless you actually need an entirely new cell for the item.
    @available(iOS 15.0, *)
    open func reconfigureItems(at indexPaths: [IndexPath])

    
    open func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) // allows multiple insert/delete/reload/move calls to be animated simultaneously. Nestable.

    
    // Support for reordering
    @available(iOS 9.0, *)
    open func beginInteractiveMovementForItem(at indexPath: IndexPath) -> Bool // returns NO if reordering was prevented from beginning - otherwise YES

    @available(iOS 9.0, *)
    open func updateInteractiveMovementTargetPosition(_ targetPosition: CGPoint)

    @available(iOS 9.0, *)
    open func endInteractiveMovement()

    @available(iOS 9.0, *)
    open func cancelInteractiveMovement()

    
    // Support for Focus
    @available(iOS 9.0, *)
    open var remembersLastFocusedIndexPath: Bool // defaults to NO. If YES, when focusing on a collection view the last focused index path is focused automatically. If the collection view has never been focused, then the preferred focused index path is used.

    
    /// When enabled, the collection view ensures that selection is automatically triggered when focus moves to a cell.
    /// Defaults to a system derived value based on platform and other properties of the collection view.
    @available(iOS 14.0, *)
    open var selectionFollowsFocus: Bool

    
    /// Determines if the collection view allows its cells to become focused.
    /// When collectionView:canFocusItemAtIndexPath: is implemented, its return value takes precedence over this method.
    /// Defaults to a system derived value based on platform and other properties of the collection view.
    @available(iOS 15.0, *)
    open var allowsFocus: Bool

    
    /// Determines if the collection view allows its cells to become focused while editing.
    /// When collectionView:canFocusItemAtIndexPath: is implemented, its return value takes precedence over this method.
    /// Defaults to a system derived value based on platform and other properties of the collection view.
    @available(iOS 15.0, *)
    open var allowsFocusDuringEditing: Bool

    
    // Drag & Drop
    
    /* YES if a drag session is currently active. A drag session begins after items are "lifted" from the collection view.
     */
    @available(iOS 11.0, *)
    open var hasActiveDrag: Bool { get }

    
    /* YES if collection view is currently tracking a drop session.
     */
    @available(iOS 11.0, *)
    open var hasActiveDrop: Bool { get }

    
    // Editing
    
    /* Controls the editing state for the receiver.
     */
    @available(iOS 14.0, *)
    open var isEditing: Bool

    
    /* Controls whether an item can be selected when the receiver is editing.
     * Defaults to NO.
     */
    @available(iOS 14.0, *)
    open var allowsSelectionDuringEditing: Bool

    
    /* Controls whether multiple item selection can occur when the receiver is editing.
     * Defaults to NO.
     */
    @available(iOS 14.0, *)
    open var allowsMultipleSelectionDuringEditing: Bool
}
