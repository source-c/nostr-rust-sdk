// Copyright (c) 2022-2023 Yuki Kishimoto
// Distributed under the MIT software license

//! RocksDB Custom Operators

use std::collections::HashSet;

use nostr_sdk_fbs::{FlatBufferBuilder, FlatBufferUtils};
use rocksdb::MergeOperands;

pub(crate) fn indexes_merge_operator(
    _new_key: &[u8],
    existing: Option<&[u8]>,
    operands: &MergeOperands,
) -> Option<Vec<u8>> {
    let mut existing: HashSet<[u8; 32]> = match existing {
        Some(val) => HashSet::decode(val).ok()?,
        None => HashSet::with_capacity(operands.len()),
    };

    for operand in operands.into_iter() {
        // Check size of operand
        if operand.len() == 32 {
            let mut event_id: [u8; 32] = [0u8; 32];
            event_id.copy_from_slice(operand);
            existing.insert(event_id);
        } else {
            existing.extend(HashSet::decode(operand).ok()?);
        }
    }

    let mut fbb = FlatBufferBuilder::with_capacity(existing.len() * 32 * 2); // Check capacity size if correct
    Some(existing.encode(&mut fbb).to_vec())
}
