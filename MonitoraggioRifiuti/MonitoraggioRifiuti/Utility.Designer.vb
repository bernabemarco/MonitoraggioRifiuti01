<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Utility
    Inherits System.Windows.Forms.Form

    'Form esegue l'override del metodo Dispose per pulire l'elenco dei componenti.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Richiesto da Progettazione Windows Form
    Private components As System.ComponentModel.IContainer

    'NOTA: la procedura che segue è richiesta da Progettazione Windows Form
    'Può essere modificata in Progettazione Windows Form.  
    'Non modificarla mediante l'editor del codice.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Utility))
        Me.SicuraDataSet = New MonitoraggioRifiuti.SicuraDataSet()
        Me.Codici_CERBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Codici_CERTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.Codici_CERTableAdapter()
        Me.TableAdapterManager = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager()
        Me.Codici_CERBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.Codici_CERDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BindingNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton()
        Me.Codici_CERBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Codici_CERBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Codici_CERBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Codici_CERBindingNavigator.SuspendLayout()
        CType(Me.Codici_CERDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'SicuraDataSet
        '
        Me.SicuraDataSet.DataSetName = "SicuraDataSet"
        Me.SicuraDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Codici_CERBindingSource
        '
        Me.Codici_CERBindingSource.DataMember = "Codici_CER"
        Me.Codici_CERBindingSource.DataSource = Me.SicuraDataSet
        '
        'Codici_CERTableAdapter
        '
        Me.Codici_CERTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.Codici_CERTableAdapter = Me.Codici_CERTableAdapter
        Me.TableAdapterManager.EXTRATESTEDOCTableAdapter = Nothing
        Me.TableAdapterManager.EXTRATESTERIFIUTITableAdapter = Nothing
        Me.TableAdapterManager.RIGHEDOCUMENTITableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'Codici_CERBindingNavigator
        '
        Me.Codici_CERBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.Codici_CERBindingNavigator.BindingSource = Me.Codici_CERBindingSource
        Me.Codici_CERBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.Codici_CERBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.Codici_CERBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.Codici_CERBindingNavigatorSaveItem})
        Me.Codici_CERBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Codici_CERBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.Codici_CERBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.Codici_CERBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.Codici_CERBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.Codici_CERBindingNavigator.Name = "Codici_CERBindingNavigator"
        Me.Codici_CERBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.Codici_CERBindingNavigator.Size = New System.Drawing.Size(800, 25)
        Me.Codici_CERBindingNavigator.TabIndex = 0
        Me.Codici_CERBindingNavigator.Text = "BindingNavigator1"
        '
        'BindingNavigatorSeparator
        '
        Me.BindingNavigatorSeparator.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorPositionItem
        '
        Me.BindingNavigatorPositionItem.AccessibleName = "Posizione"
        Me.BindingNavigatorPositionItem.AutoSize = False
        Me.BindingNavigatorPositionItem.Name = "BindingNavigatorPositionItem"
        Me.BindingNavigatorPositionItem.Size = New System.Drawing.Size(50, 23)
        Me.BindingNavigatorPositionItem.Text = "0"
        Me.BindingNavigatorPositionItem.ToolTipText = "Posizione corrente"
        '
        'BindingNavigatorCountItem
        '
        Me.BindingNavigatorCountItem.Name = "BindingNavigatorCountItem"
        Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(34, 22)
        Me.BindingNavigatorCountItem.Text = "di {0}"
        Me.BindingNavigatorCountItem.ToolTipText = "Numero totale di elementi"
        '
        'BindingNavigatorSeparator1
        '
        Me.BindingNavigatorSeparator1.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorSeparator2
        '
        Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 25)
        '
        'Codici_CERDataGridView
        '
        Me.Codici_CERDataGridView.AutoGenerateColumns = False
        Me.Codici_CERDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Codici_CERDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4})
        Me.Codici_CERDataGridView.DataSource = Me.Codici_CERBindingSource
        Me.Codici_CERDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Codici_CERDataGridView.Location = New System.Drawing.Point(0, 25)
        Me.Codici_CERDataGridView.Name = "Codici_CERDataGridView"
        Me.Codici_CERDataGridView.Size = New System.Drawing.Size(800, 425)
        Me.Codici_CERDataGridView.TabIndex = 1
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "CODCER"
        Me.DataGridViewTextBoxColumn1.HeaderText = "CODCER"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "DESCRIZIONECER"
        Me.DataGridViewTextBoxColumn2.HeaderText = "DESCRIZIONECER"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "ID"
        Me.DataGridViewTextBoxColumn3.HeaderText = "ID"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        Me.DataGridViewTextBoxColumn3.ReadOnly = True
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "DescrizioneCerEstesa"
        Me.DataGridViewTextBoxColumn4.HeaderText = "DescrizioneCerEstesa"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        Me.DataGridViewTextBoxColumn4.ReadOnly = True
        '
        'BindingNavigatorAddNewItem
        '
        Me.BindingNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorAddNewItem.Image = CType(resources.GetObject("BindingNavigatorAddNewItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorAddNewItem.Name = "BindingNavigatorAddNewItem"
        Me.BindingNavigatorAddNewItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorAddNewItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorAddNewItem.Text = "Aggiungi nuovo"
        '
        'BindingNavigatorDeleteItem
        '
        Me.BindingNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorDeleteItem.Image = CType(resources.GetObject("BindingNavigatorDeleteItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorDeleteItem.Name = "BindingNavigatorDeleteItem"
        Me.BindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorDeleteItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorDeleteItem.Text = "Elimina"
        '
        'BindingNavigatorMoveFirstItem
        '
        Me.BindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveFirstItem.Image = CType(resources.GetObject("BindingNavigatorMoveFirstItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveFirstItem.Name = "BindingNavigatorMoveFirstItem"
        Me.BindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveFirstItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveFirstItem.Text = "Sposta in prima posizione"
        '
        'BindingNavigatorMovePreviousItem
        '
        Me.BindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMovePreviousItem.Image = CType(resources.GetObject("BindingNavigatorMovePreviousItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMovePreviousItem.Name = "BindingNavigatorMovePreviousItem"
        Me.BindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMovePreviousItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMovePreviousItem.Text = "Sposta indietro"
        '
        'BindingNavigatorMoveNextItem
        '
        Me.BindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveNextItem.Name = "BindingNavigatorMoveNextItem"
        Me.BindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveNextItem.Text = "Sposta avanti"
        '
        'BindingNavigatorMoveLastItem
        '
        Me.BindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveLastItem.Name = "BindingNavigatorMoveLastItem"
        Me.BindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveLastItem.Text = "Sposta in ultima posizione"
        '
        'Codici_CERBindingNavigatorSaveItem
        '
        Me.Codici_CERBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.Codici_CERBindingNavigatorSaveItem.Image = CType(resources.GetObject("Codici_CERBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.Codici_CERBindingNavigatorSaveItem.Name = "Codici_CERBindingNavigatorSaveItem"
        Me.Codici_CERBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.Codici_CERBindingNavigatorSaveItem.Text = "Salva dati"
        '
        'Utility
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(800, 450)
        Me.Controls.Add(Me.Codici_CERDataGridView)
        Me.Controls.Add(Me.Codici_CERBindingNavigator)
        Me.Name = "Utility"
        Me.Text = "Utility"
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Codici_CERBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Codici_CERBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Codici_CERBindingNavigator.ResumeLayout(False)
        Me.Codici_CERBindingNavigator.PerformLayout()
        CType(Me.Codici_CERDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents SicuraDataSet As SicuraDataSet
    Friend WithEvents Codici_CERBindingSource As BindingSource
    Friend WithEvents Codici_CERTableAdapter As SicuraDataSetTableAdapters.Codici_CERTableAdapter
    Friend WithEvents TableAdapterManager As SicuraDataSetTableAdapters.TableAdapterManager
    Friend WithEvents Codici_CERBindingNavigator As BindingNavigator
    Friend WithEvents BindingNavigatorAddNewItem As ToolStripButton
    Friend WithEvents BindingNavigatorCountItem As ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem As ToolStripButton
    Friend WithEvents BindingNavigatorMoveFirstItem As ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem As ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator2 As ToolStripSeparator
    Friend WithEvents Codici_CERBindingNavigatorSaveItem As ToolStripButton
    Friend WithEvents Codici_CERDataGridView As DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As DataGridViewTextBoxColumn
End Class
