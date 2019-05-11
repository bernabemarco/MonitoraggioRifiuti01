Public Class DettaglioDoc

    Public Property stringfilter As String

    'Private Sub RIGHEDOCUMENTIBindingNavigatorSaveItem_Click(sender As Object, e As EventArgs)
    '    Me.Validate()
    '    Me.RIGHEDOCUMENTIBindingSource.EndEdit()
    '    Me.TableAdapterManager.UpdateAll(Me.SicuraDataSet)

    'End Sub

    Private Sub DettaglioDoc_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        stringfilter = CInt(stringfilter)
        Me.RIGHEDOCUMENTITableAdapter.FillByIdTestaRighedocumenti(Me.SicuraDataSet.RIGHEDOCUMENTI, stringfilter)
        '        Me.RIGHEDOCUMENTITableAdapter.FillByidtesta2(Me.SicuraDataSet.RIGHEDOCUMENTI, stringfilter)


    End Sub

    Private Sub RIGHEDOCUMENTIBindingNavigatorSaveItem_Click(sender As Object, e As EventArgs)
        Me.Validate()
        Me.RIGHEDOCUMENTIBindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.SicuraDataSet)

    End Sub



    'Private Sub RIGHEDOCUMENTIBindingNavigatorSaveItem_Click_1(sender As Object, e As EventArgs)
    '    Me.Validate()
    '    Me.RIGHEDOCUMENTIBindingSource.EndEdit()
    '    Me.TableAdapterManager.UpdateAll(Me.SicuraDataSet)

    'End Sub
End Class